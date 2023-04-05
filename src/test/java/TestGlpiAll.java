import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import ui.TestGlpiUi;
import api.TestGlpiApi;

@RunWith(Suite.class)
    @Suite.SuiteClasses({TestGlpiUi.class, TestGlpiApi.class})
    public class TestsOpSuite {
        @BeforeClass
        public static void setUpClass() throws Exception {
            System.out.println("setUpClass TestsOpSuite");
        }

        @AfterClass
        public static void tearDownClass() throws Exception {
            System.out.println("tearDownClass TestsOpSuite");
        }

        @Before
        public void setUp() {
            System.out.println("setUp TestsOpSuite");
        }

        @After
        public void tearDown() {
            System.out.println("tearDown TestsOpSuite");
        }
    }


