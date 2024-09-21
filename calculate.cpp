#include "calculate.h"
#include <QDebug>
#include <stack>
#include <sstream>
#include <cctype>
#include <set>
#include <QString>

Calculate::Calculate(QObject *parent)
    : QObject{parent}
    , m_result("")
{}

QString Calculate::result() const {
    return m_result;
}

void Calculate::evaluateExpression(const QString &expression) {
    std::string expr = expression.toStdString();
    std::istringstream iss(expr);
    std::stack<double> numbers;
    std::set<double> uniqueNumbers;
    std::stack<char> operators;

    auto applyOp = [&](char op) {
        try {
            double right = numbers.top(); numbers.pop();
            double left = numbers.top(); numbers.pop();
            switch (op) {
            case '+': numbers.push(left + right); break;
            case '-': numbers.push(left - right); break;
            case '*': numbers.push(left * right); break;
            case '/':
                if (right != 0) {
                    numbers.push(left / right);
                } else {
                    m_result = "Error: Division by zero";
                    emit resultChange();
                    return;
                }
                break;
            case '%':
                if (right != 0) {
                    numbers.push(static_cast<int>(left) % static_cast<int>(right));
                } else {
                    m_result = "Error: Division by zero";
                    emit resultChange();
                    return;
                }
                break;
            }
        }
        catch (...) {
            m_result = "Error in expression";
            emit resultChange();
            return;
        }
    };

    auto precedence = [&](char op) {
        if (op == '+' || op == '-') return 1;
        if (op == '*' || op == '/' || op == '%') return 2;
        return 0;
    };

    auto processOperators = [&](char currentOp) {
        while (!operators.empty() && operators.top() != '(' &&
               precedence(operators.top()) >= precedence(currentOp)) {
            applyOp(operators.top());
            operators.pop();
        }
        operators.push(currentOp);
    };

    while (iss) {
        char ch;
        if (iss >> ch) {
            if (std::isdigit(ch) || ch == '.') {
                iss.putback(ch);
                double num;
                iss >> num;
                numbers.push(num);
            } else if (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '%') {
                processOperators(ch);
            } else if (ch == '(') {
                operators.push(ch);
            } else if (ch == ')') {
                while (!operators.empty() && operators.top() != '(') {
                    applyOp(operators.top());
                    operators.pop();
                }
                if (!operators.empty()) operators.pop();  // Pop the '('
            }
        }
    }

    while (!operators.empty()) {
        applyOp(operators.top());
        operators.pop();
    }

    if (!numbers.empty()) {
        m_result = QString::number(numbers.top());
        emit resultChange();
    } else {
        m_result = "Error: No result";
        emit resultChange();
    }
}
