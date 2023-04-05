import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import ui.TestGlpiUi;
import api.TestGlpiApi;

    @RunWith(Suite.class)
    @Suite.SuiteClasses({TestGlpiApi.class, TestGlpiUi.class })
    public class TestSuiteGlpiApiUi {
        @BeforeClass
        public static void setUpClass() throws Exception {
            System.out.println("setUpClass TestSuiteGlpiApiUi");

        }

        @AfterClass
        public static void tearDownClass() throws Exception {
            System.out.println("tearDownClass TestSuiteGlpiApiUi");
        }

        @Before
        public void setUp() {
            System.out.println("setUp TestSuiteGlpiApiUi");
        }

        @After
        public void tearDown() {
            System.out.println("tearDown TestSuiteGlpiApiUi");
        }
    }


