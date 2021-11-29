import java.util.Arrays;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws Exception {
        if (args.length != 1 && args.length != 2) {
            System.out.println("usage: checker.jar ./contest [initial signal]");
            return;
        }
        ProcessBuilder pb = new ProcessBuilder().command(args[0]);
        Process p = pb.start();

        Scanner s = new Scanner(p.getInputStream());

        int pid = s.nextInt();
        Runtime.getRuntime().exec("kill -SIGSTOP " + p.pid()).waitFor();
        if (p.pid() == pid) {
            if (args.length == 2) {
                Runtime.getRuntime().exec("kill -" + args[1] + " " + p.pid()).waitFor();
            }
        } else {
            System.out.println("Wrong PID: got " + pid + ", expected " + p.pid());
            return;
        }
        Runtime.getRuntime().exec("kill -SIGCONT " + p.pid()).waitFor();
        for (int i = 0; i < 5; i++) {
            Runtime.getRuntime().exec("kill -SIGHUP " + p.pid());
            if (s.nextInt() != i) {
                System.out.println("WA");
                return;
            }
        }
        Runtime.getRuntime().exec("kill -SIGHUP " + p.pid());
        if (s.hasNext()){
            System.out.println("What are you trying to write here? Just die");
            return;
        }
        if(p.waitFor() == 0){
            System.out.println("OK");
        }
        if (p.isAlive()) {
            System.out.println("Still alive? U gonna die!");
            //p.destroyForcibly();
            Runtime.getRuntime().exec("kill -SIGSEGV " + p.pid());
            return;
        }

    }
}
