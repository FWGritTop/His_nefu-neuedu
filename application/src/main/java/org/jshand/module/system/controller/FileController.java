
package org.jshand.module.system.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@RestController
@CrossOrigin
@RequestMapping("/file")
public class FileController {
    private String filePath="d:/hisdata/";

    /**
     * 前往上传页面
     * @return 页面名称
     */
    @GetMapping({"/upload", ""})
    public String goIndex() {
        return "upload";
    }
    /**
     *  将文件保存到指定文件夹
     * @param file  单个文件
     * @return      重定向到controller层中前往下载页面的url
     * @throws IOException
     */
    @PostMapping("/upload")
    public String uploadAndGoDownLoad(MultipartFile file) throws IOException {
        System.out.println("收到文件");
        //判断文件夹是否存在，不存在时，创建文件夹
        File directoryFile = new File(filePath);
        if (!directoryFile.exists()) {
            //创建多个文件夹
            directoryFile.mkdirs();
        }
        //判断文件是否为空，不为空时，保存文件
        if (!file.isEmpty()) {
            saveFile(file);
        }
        System.out.println("已上传:"+file.getOriginalFilename());
        return file.getOriginalFilename();
    }
    /**
     * 保存文件到指定位置
     * @param file 需要上传的文件
     * @throws IOException
     */
    public void saveFile(MultipartFile file) throws IOException {
        //获取文件名
        String name = file.getOriginalFilename();
        file.transferTo(new File(filePath + name));
    }

    @GetMapping  ("/getfile")
    public String getfiles(String filename) throws IOException {
        System.out.println("收到文件"+filename);
        //判断文件夹是否存在，不存在时，创建文件夹
        FileInputStream fs  = new FileInputStream(filePath+filename);
        byte[] bytes = new byte[fs.available()];
        fs.read(bytes);
        fs.close();
        fs = null;
        System.out.println("文件已获取返回");
        BASE64Encoder encoder = new BASE64Encoder();
        String data = encoder.encode(bytes);
        return data;
    }
}