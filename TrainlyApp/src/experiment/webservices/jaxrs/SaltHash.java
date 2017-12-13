package experiment.webservices.jaxrs;

import static java.lang.Math.*;
import java.security.MessageDigest;
import java.util.Random;

/**
 * Utility class to generate salted hash passwords;
 */
public class SaltHash {

    public static void main(String[] args) {
        System.out.println(saltHashPass("p@ssword"));
    }
    
    public static String saltHashPass(String pass){
        String salt = genSalt(7);
        return "$"+salt+"$"+sha256(salt+pass);
    }

    public static String genSalt(int length) {
        String alphabet = new String("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"); //9
        int n = alphabet.length(); //10

        String result = new String();
        Random r = new Random(); //11

        for (int i = 0; i < length; i++) //12
        {
            result = result + alphabet.charAt(r.nextInt(n)); //13
        }
        return result;
    }
    
    public static String sha256(String base) {
        try{
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            return hexString.toString();
        } catch(Exception ex){
           throw new RuntimeException(ex);
        }
    }
}