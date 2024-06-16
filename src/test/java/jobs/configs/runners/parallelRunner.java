package jobs.configs.runners;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;

public class parallelRunner {
 public static void main(String[] args) {


 }
 @Test
 public void executeTest(){
  Builder builder = new Builder();
  builder.path("classpath:requests");
  builder.threads(5);
 }

}
