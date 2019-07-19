package pikapika.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Zaiyao {
	Zaiyao(){

	};
	static public String deal(String userPassWord) throws NoSuchAlgorithmException{
		String salt = "cqjtu";
		MessageDigest md = MessageDigest.getInstance("MD5");
        	// 计算md5函数
        md.update((userPassWord+salt).getBytes());
        return new BigInteger(1, md.digest()).toString(16);
	}
}
