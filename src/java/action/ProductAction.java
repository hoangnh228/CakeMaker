/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import controller.CategoryController;
import controller.DiscountController;
import controller.ProductController;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import model.Category;
import model.Discount;
import model.Product;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author cam
 */
public class ProductAction extends ActionSupport implements ServletRequestAware {
    
    private Product product = new Product();
    private final ProductController controller;
    private final DiscountController dController;
    private final CategoryController cController;
    private int id;
    private List<Product> list = new ArrayList<>();
    public List<Category> cList = new ArrayList<>();
    public List<Discount> dList = new ArrayList<>();
    private HttpServletRequest request;
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    
    public String getAll() {
        list = controller.getAll();
        ServletActionContext.getRequest().getSession().setAttribute("list", list);
        return SUCCESS;
    }
    
    public String createForm() {
        cList = cController.getAll();
        dList = dController.getAll();
        return SUCCESS;
    }
    
    public String create() throws Exception {
        String filePath = request.getSession().getServletContext().getRealPath("/").concat("public\\upload\\product");
        Random rand = new Random();
        int n = rand.nextInt(99999) + 1;
        File fileToCreate = new File(filePath, n + "_" + this.getUploadFileName());  
        FileUtils.copyFile(this.getUpload(), fileToCreate);
        product.setImage(n + "_" + this.getUploadFileName());
        boolean insert = controller.insert(this.getProduct());
        
        if(insert == true) {
            this.addActionMessage("Create product success!");
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            return SUCCESS;
        } else {
            cList = cController.getAll();
            dList = dController.getAll();
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String getById() {
        cList = cController.getAll();
        dList = dController.getAll();
        int cid = Integer.parseInt(request.getParameter("id"));
        this.product = controller.getById(id);
        System.out.println(this.product.getCategory_id());
        ServletActionContext.getRequest().getSession().setAttribute("product", this.product);
        return SUCCESS;
    }
    
    public String update() throws Exception {
        if(this.getUpload() != null) {
            String filePath = request.getSession().getServletContext().getRealPath("/").concat("public\\upload\\product");
            Random rand = new Random();
            int n = rand.nextInt(99999) + 1;
            File fileToCreate = new File(filePath, n + "_" + this.getUploadFileName());  
            FileUtils.copyFile(this.getUpload(), fileToCreate);
            product.setImage(n + "_" + this.getUploadFileName());
        } else {
            Product detail = controller.getById(this.product.getId());
            product.setImage(detail.getImage());
        }

        int update = controller.update(this.getProduct());
        
        if(update != 0) {
            this.addActionMessage("Update product success!");
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            return SUCCESS;
        } else {
            cList = cController.getAll();
            dList = dController.getAll();
            this.addActionError("Have some error, please try again!");
            return INPUT;
        }
    }
    
    public String delete() {
        int cid = Integer.parseInt(request.getParameter("id"));
        int delete = controller.delete(cid);
        if(delete != 0) {
            this.addActionMessage("Delete product success!");
            list = controller.getAll();
            ServletActionContext.getRequest().getSession().setAttribute("list", list);
            return SUCCESS;
        } else {
            this.addActionError("Have some error, please try again!");
            return ERROR;
        }
    }
    
    public ProductAction() {
        controller = new ProductController();
        dController = new DiscountController();
        cController = new CategoryController();
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Product> getList() {
        return list;
    }

    public void setList(List<Product> list) {
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
