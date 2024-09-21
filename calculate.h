#ifndef CALCULATE_H
#define CALCULATE_H

#include <QObject>
#include <QString>
#include <cmath>
#include <cctype>

class Calculate : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString result READ result  NOTIFY resultChange)

public:
    explicit Calculate(QObject *parent = nullptr);

    QString result() const;
    Q_INVOKABLE void evaluateExpression(const QString &expression);

signals:
    void resultChange();
private:
    QString m_result;
};

#endif // CALCULATE_H
