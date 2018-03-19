package pja.jaz;

import pja.jaz.model.Credit;
import pja.jaz.model.CreditInstalment;
import pja.jaz.model.CreditType;


public class CreditCalculator {

    public Credit makeSimulation(double capital, int period, double interestRate,
                                 double fixedCharge, CreditType creditType) {

        Credit credit = null;

        if (null != creditType) {
            credit = new Credit(capital, period, interestRate, fixedCharge, creditType);

            double capitalPart = capital / period;
            double fixedChargePart = fixedCharge / period;
            double interestPart = 0;

            if (creditType == CreditType.EQUAL) {
                double q = 1 + ((interestRate / 100) / 12);
                double qn = Math.pow(q, period);
                interestPart = capital * qn * (q - 1) / (qn - 1) - capitalPart;
            }

            if (creditType == CreditType.DECREASING) {
                interestPart = capital * (interestRate / 100 / 12);
            }

            for (int i = 1; i <= period; i++) {
                credit.addInstalment(new CreditInstalment(i, capitalPart, interestPart, fixedChargePart));

                if (creditType == CreditType.DECREASING) {
                    interestPart = (capital - (i * capitalPart)) * (interestRate / 100 / 12);
                }
            }
        }

        return credit;
    }


}
