package pikapika.util;

import java.io.File;
import java.io.IOException;
import java.net.PortUnreachableException;

import org.springframework.core.OverridingClassLoader;
import org.springframework.web.multipart.MultipartFile;

/**
 * 放弃使用这个了
 */
public class FileOnload {
	
	static public String onload(MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("fileonload: ");
		if(!file.isEmpty()) {
System.out.println("OriginalFilename: ");
System.out.println(file.getOriginalFilename());
	        String name = System.currentTimeMillis()+"";
	        String newFileName = name + file.getOriginalFilename();
//	        File newFile = new File("d://uploadFiles", newFileName);
			File newFile = new File("/root/uploadFiles", newFileName);
	        //Linux上部署记得换路径
	        newFile.getParentFile().mkdirs();
	        file.transferTo(newFile);
	        
	        return newFileName;
	        
		}else{
			System.out.println("文件为空");
		}
		return null;
	}
}
