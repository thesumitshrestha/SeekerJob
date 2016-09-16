package resourcepool

import org.springframework.web.multipart.commons.CommonsMultipartFile

class UploadController {

    def save(){
        String s=""
        CommonsMultipartFile f=request.getFile('fileupload')
        final String name =f.getOriginalFilename()
        def fos= new FileOutputStream(new File(name))
        f.getBytes().each{ fos.write(it) }
//        s=Base64.encode(f.getBytes())
        fos.flush()
        fos.close()
        render 'done now refresh your source directory to see the file ${s}'
    }
}
