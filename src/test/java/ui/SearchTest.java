package ui;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(Parameterized.class)
public class SearchTest {
    public String searchValue;

    private POS pos = new POS();



    public SearchTest(String searchValue) {
        this.searchValue = searchValue;
    }


    @Parameterized.Parameters
    public static Collection input() {
        String[] searchValues = new String[] {"4902430429399","4905596171720","5000219020122","5000299225028","8712000051037","8858705600191"};

        return Arrays.asList(searchValues);
    }

    @Test
    public void findProudctByIdExist() {
        List<Object[]> listProduct;
        listProduct = pos.searchProduct(searchValue);
        assertEquals(1,listProduct.size());
        assertEquals(searchValue,listProduct.get(0)[0]);
    }

}
