<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Symulacja kredytu</title>
   
</head>
<body>

    <header>
            <h1>Symulacja kredytu</h1>
    </header>

    <main class="content" role="main">

        <fmt:setLocale value="pl_PL" />
        <table class="summary">
            <tr>
                <th>Kapitał</th>
                <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${credit.capital}" /></td>
            </tr>
            <tr>
                <th>Ilość rat</th>
                <td><fmt:formatNumber type="number" value="${credit.period}" /></td>
            </tr>
            <tr>
                <th>Oprocentowanie</th>
                <td><fmt:formatNumber type="percent" minFractionDigits="2" value="${credit.interestRate/100}" /></td>
            </tr>
            <tr>
                <th>Opłata stała</th>
                <td><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${credit.fixedCharges}" /> zł</td>
            </tr>
            <tr>
                <th>Rodzaj rat</th>
                <td>${credit.type}</td>
            </tr>
        </table>

        <table class="simulation">
            <thead>
                <tr>
                    <th>Numer raty</th>
                    <th>Kapitał</th>
                    <th>Odsetki</th>
                    <th>Opłaty stałe</th>
                    <th>Kwota raty</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${credit.instalments}" var="instalment">
                <tr>
                    <td>${instalment.instalment}</td>
                    <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${instalment.capital}" /></td>
                    <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${instalment.interest}" /></td>
                    <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${instalment.fixedCharge}" /></td>
                    <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${instalment.total}" /></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>

        <table class="summary">
            <tr>
                <th width="300">Razem kapitał</th>
                <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${credit.totalCapital}" /></td>
            </tr>
            <tr>
                <th>Razem odsetki</th>
                <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${credit.totalInterest}" /></td>
            </tr>
            <tr>
                <th>Razem stałe opłaty</th>
                <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${credit.totalFixedCharges}" /></td>
            </tr>
            <tr>
                <th>Razem koszt kredytu:</th>
                <td><fmt:formatNumber type="currency" minFractionDigits="2" maxFractionDigits="2" value="${credit.totalCreditCost}" /></td>
            </tr>
        </table>

    </main>

    <footer class="site-footer clearfix">
        Copyright &copy; 2017
    </footer>
</body>
</html>
