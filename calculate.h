#ifndef CALCULATE_H
#define CALCULATE_H

#include <QObject>
#include <QString>
#include <cmath>
#include <cctype>

class Calculate : public QObject
{
    Q_OBJECT

public:
    explicit Calculate(QObject *parent = nullptr);

public slots:
    void evaluateExpression(const QString &expression);

private:
    double m_result;
};

#endif // CALCULATE_H
