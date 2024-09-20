#include "calculate.h"
#include <QDebug>
#include <stack>
#include <sstream>
#include <cctype>
#include <QString>
#include <stdexcept>

Calculate::Calculate(QObject *parent)
    : QObject{parent}
    , m_result(0)
{}

void Calculate::evaluateExpression(const QString &expression) {
    std::string expr = expression.toStdString();
    std::istringstream iss(expr);
    std::stack<double> numbers;
    std::stack<char> operators;
    qDebug() << expr;
    auto applyOp = [&](char op) {
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
                throw std::runtime_error("Division by zero");
            }
            break;
        }
    };

    auto precedence = [&](char op) {
        if (op == '+' || op == '-') return 1;
        if (op == '*' || op == '/') return 2;
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
            } else if (ch == '+' || ch == '-' || ch == '*' || ch == '/') {
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
        m_result = numbers.top();
        qDebug() << m_result;
    } else {
        qDebug() << "Error: No result";
    }
}
