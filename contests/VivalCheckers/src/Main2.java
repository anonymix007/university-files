import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class Main2 {

    public static void main(String[] args) throws Exception {
        if (args.length != 1 && args.length != 2) {
            System.out.println("usage: checker.jar ./contest [initial signal]");
            return;
        }
        ProcessBuilder pb = new ProcessBuilder().command(args[0]);
        Process p = pb.start();

        Scanner in = new Scanner(p.getInputStream());
        int pid = in.nextInt();

        if (p.pid() == pid) {
            if (args.length == 2) {
                Runtime.getRuntime().exec("kill -" + args[1] + " " + p.pid()).waitFor();
            }
        } else {
            System.out.println("Wrong PID: got " + pid + ", expected " + p.pid());
            return;
        }

        Scanner s = new Scanner(System.in);
        PrintWriter out = new PrintWriter(p.getOutputStream());
        while (s.hasNextLine()) {
            String line = s.nextLine().replaceAll("\\\\n", "");
            if (line.startsWith("SIG")) {
                Runtime.getRuntime().exec("kill -" + line + " " + p.pid()).waitFor();
            } else {
                out.println(line);
                out.flush();
            }
        }
        out.close();

        while(in.hasNext()){
            System.out.println(in.next());
        }
    }
}
