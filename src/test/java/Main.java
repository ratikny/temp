import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Write any word: ");
        String input = scanner.nextLine();

        input = input.toLowerCase().replaceAll("\\s+", "");
        String reserved = "";

        for (int i = input.length() - 1;i >= 0;i--){
            reserved = reserved + input.charAt(i);
        }
        if (input.equals(reserved)){
            System.out.println("Yes this is palindrome");
        }else {
            System.out.println("This is not palindrome");
        }
        scanner.close();



    }


}

