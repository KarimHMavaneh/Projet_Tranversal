import api.TestGlpiApi;
import ui.TestGlpiUi;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({TestGlpiApi.class, TestsGlpiUi.class})
public class TestsGlpiSuite {
    @BeforeClass
    public static void setUpClass() throws Exception {
        System.out.println("setUpClass Tests Glpi");
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
        System.out.println("tearDownClass TestsGlpi");
    }

    @Before
    public void setUp() {
        System.out.println("setUp TestsGlpi");
    }

    @After
    public void tearDown() { System.out.println("tearDown TestsGlpi");
    }
}
