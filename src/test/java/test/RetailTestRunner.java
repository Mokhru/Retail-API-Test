package test;

import com.intuit.karate.junit5.Karate;

public class RetailTestRunner {
	
@Karate.Test
	
	public Karate runTest() {
		return Karate.run("classpath:features").tags("@completeTest").outputCucumberJson(true);
	}

}
