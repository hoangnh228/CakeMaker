/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import controller.BannerController;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import model.Banner;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Orange
 */
public class BannerAction extends ActionSupport implements ServletRequestAware {
    
    private Banner banner;
    private final BannerController controller;
    private int id;
    private List<Banner> list = new ArrayList<>();
    private HttpServletRequest request;
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    
    public String getAll() {
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        return SUCCESS;
    }
    
    public String create() throws Exception {
        String filePath = request.getSession().getServletContext().getRealPath("/").concat("public\\upload\\banner");
        Random rand = new Random();
        int n = rand.nextInt(99999) + 1;
        File fileToCreate = new File(filePath, n + "_" + this.getUploadFileName());  
        FileUtils.copyFile(this.getUpload(), fileToCreate);
        banner = new Banner();
        this.getBanner().setUrl(n + "_" + this.getUploadFileName());
        boolean insert = controller.insert(this.getBanner());
        
        if(insert == true) {
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            this.addActionMessage("Upload banner success!");
            return SUCCESS;
        } else {
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String delete() {
        int cid = Integer.parseInt(request.getParameter("id"));
        int delete = controller.delete(cid);
        if(delete != 0) {
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            this.addActionMessage("Delete banner success!");
            return SUCCESS;
        } else {
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public BannerAction() {
        controller = new BannerController();
    }

    public Banner getBanner() {
        return banner;
    }

    public void setBanner(Banner banner) {
        this.banner = banner;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Banner> getList() {
        return list;
    }

    public void setList(List<Banner> list) {
        this.list = list;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }
    
}
