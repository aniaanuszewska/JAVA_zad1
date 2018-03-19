package pja.jaz;

import org.junit.Test;
import pja.jaz.model.Credit;
import pja.jaz.model.CreditType;
//import java.io.ByteArrayOutputStream;

import static org.assertj.core.api.Assertions.assertThat;

public class CreditCalculatorTest {

    @Test
    public void makeSimulation_EqualInstalments_Credit() {
        Credit result = new CreditCalculator().makeSimulation(200000, 120, 2.5, 0, CreditType.EQUAL);
        assertThat(result).isNotNull();
        assertThat(result.getInstalments()).hasSize(10);
    }
}
