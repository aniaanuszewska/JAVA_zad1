package pja.jaz.servlet;

import org.junit.Test;
import org.mockito.Mockito;
import pja.jaz.model.Credit;
import pja.jaz.model.CreditType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import static org.assertj.core.api.Assertions.assertThat;

public class CreditCalculatorServletTest extends Mockito {

    @Test
    public void processCredit_CorrectParameters_Credit() throws IOException {
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);

        when(request.getParameter("capital")).thenReturn("200000");
        when(request.getParameter("instalments")).thenReturn("120");
        when(request.getParameter("interestRate")).thenReturn("2.5");
        when(request.getParameter("fixedCharge")).thenReturn("0");
        when(request.getParameter("type")).thenReturn("EQUAL");

        Credit credit = new CreditCalculatorServlet().processCredit(request, response);

        assertThat(credit).isNotNull();
        assertThat(credit.getCapital()).isEqualTo(200000);
        assertThat(credit.getInstalments()).size().isEqualTo(120);
        assertThat(credit.getInterestRate()).isEqualTo(2.5);
        assertThat(credit.getFixedCharges()).isEqualTo(0);
        assertThat(credit.getType()).isEqualTo(CreditType.EQUAL);
    }
}
