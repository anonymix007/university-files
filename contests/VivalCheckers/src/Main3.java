import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class Main3 {

    static boolean isMonotonic(ArrayList<Long> A) {
        long prev = 0;
        for (int i = 0; i < A.size() - 1; ++i) {
            int c = Long.compare(A.get(i), A.get(i + 1));
            if (c != 0) {
                if (c != prev && prev != 0) {
                    return false;
                }
                prev = c;
            }
        }
        return true;
    }

    static boolean isPrime(long x) {
        for (long p = 2; p * p < x; p++) {
            if (x % p == 0) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 4 && args.length != 3) {
            System.out.println("usage: checker.jar ./contest low high [initial signal]");
            return;
        }
        ProcessBuilder pb = new ProcessBuilder().command(args[0]);

        long low = Long.parseLong(args[1]);
        long high = Long.parseLong(args[2]);

        Process p = pb.start();
        Scanner in = new Scanner(p.getInputStream());

        PrintWriter out = new PrintWriter(p.getOutputStream());
        out.println(low + " " + high);
        out.close();
        int pid = in.nextInt();

        if (p.pid() == pid) {
            if (args.length == 4) {
                Runtime.getRuntime().exec("kill -" + args[3] + " " + p.pid()).waitFor();
            }
        } else {
            System.out.println("Wrong PID: got " + pid + ", expected " + p.pid());
            return;
        }
        Scanner s = new Scanner(System.in);
        int cint = 0;

        while (s.hasNextLine()) {
            String line = s.nextLine().replaceAll("\\\\n", "");
            if (line.startsWith("SIG")) {
                Runtime.getRuntime().exec("kill -" + line + " " + p.pid()).waitFor();
            }
            if (line.equals("SIGINT")) cint++;
        }


        if(p.waitFor() != 0){
            System.out.println("Runtime Error");
            return;
        }
        ArrayList<Long> values = new ArrayList<>();
        while (in.hasNextLong()) {
            long x = in.nextLong();
            if (isPrime(x)) {
                values.add(x);
            } else {
                System.out.println("Not prime: " + x);
                return;
            }
        }
        if (!isMonotonic(values)) {
            System.out.println("The sequence is not monotonous");
            return;
        }
        if (values.size() != cint){
            if(values.size() == 1 && values.get(0) == -1){
                System.out.println("OK");
                return;
            }
            System.out.println("Too much outputs: " + values.size());
            return;
        }
        System.out.println("OK");
    }
}
