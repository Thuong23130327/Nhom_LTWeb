package controller.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.ProductVariant;
import service.AdMngDetailProductService;
import service.ProductDetailService;
import util.CloundinaryLib;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
@WebServlet(name = "AdUpdateProduct", value = "/admin/upd-product")
public class AdUpdateProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        AdMngDetailProductService service = new AdMngDetailProductService();
        System.out.println("--- CHECK POINT ---");
        System.out.println("Action nhận được: [" + action + "]");
        String pid = request.getParameter("pid");
        HttpSession session = request.getSession();

        if (action.equals("updateProduct")) {
            String cate = request.getParameter("inputCate");
            String inputPid = request.getParameter("inputPid");
            String inputNameProduct = request.getParameter("inputNameProduct");
            String inputBrand = request.getParameter("inputBrand");
            String inputSku = request.getParameter("inputSku");
            String inputDiscrip = request.getParameter("inputDiscrip");
            String variantSelect = request.getParameter("variantSelect");
            String isActiveRaw = request.getParameter("isActive");
            String isActive = (isActiveRaw != null) ? "1" : "0";

            System.out.println(cate);
            System.out.println(inputPid);
            System.out.println(inputNameProduct);
            System.out.println(inputBrand);
            System.out.println(inputSku);
            System.out.println(inputDiscrip);
            System.out.println(variantSelect);
            System.out.println(isActiveRaw);
            System.out.println(isActive);
            try {
                boolean a = service.updateProduct(inputPid, inputBrand, cate, inputNameProduct, inputSku, inputDiscrip, variantSelect, isActive);
                if (a) {
                    session.setAttribute("msg", "success");
                    request.getRequestDispatcher("/admin/product-detail-manager?pid=" + inputPid).forward(request, response);
                } else {
                    request.setAttribute("msg", "fail");
                    request.getRequestDispatcher("/admin/product-detail-manager?pid=" + inputPid).forward(request, response);
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        } else if (action.equals("updateSpec")) {
            String inputPid = request.getParameter("inputPid");
            String[] inputSpecValue = request.getParameterValues("inputSpecValue");
            String[] inputSpecIds = request.getParameterValues("inputSpecIds");
            try {
                boolean a = service.updateSpecs(inputSpecIds, inputSpecValue);
                if (a) {
                    request.setAttribute("msg", "success");
                    request.getRequestDispatcher("/admin/product-detail-manager?pid=" + inputPid).forward(request, response);
                } else {
                    request.setAttribute("msg", "fail");
                    request.getRequestDispatcher("/admin/product-detail-manager?pid=" + inputPid).forward(request, response);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (action.equals("updateVariantSelect")) {
            String vid = request.getParameter("vid");
            String inputClName = request.getParameter("inputClName");
            String inputStock = request.getParameter("inputStock");
            String inputOldP = request.getParameter("inputOldP");
            String inputNewP = request.getParameter("inputNewP");
            String currentImg = request.getParameter("currentImgUrl");
            String inputPid = request.getParameter("inputPid");

            //Upanh len cldinary
            Part filePart = request.getPart("productImage");
            String finalImgUrl = currentImg;

            if (filePart != null && filePart.getSize() > 0) {
                Cloudinary cloudinary = CloundinaryLib.getCloudinary();
                byte[] fileBytes = filePart.getInputStream().readAllBytes();
                Map uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.emptyMap());

                finalImgUrl = uploadResult.get("secure_url").toString();
            }

            boolean a = false;
            try {
                a = service.updateVariant(vid, inputClName, inputStock, inputOldP, inputNewP, finalImgUrl);
                if (a) {
                    request.setAttribute("msg", "success");
                    request.getRequestDispatcher("/admin/product-detail-manager?pid=" + inputPid).forward(request, response);
                } else {
                    request.setAttribute("msg", "fail");
                    request.getRequestDispatcher("/admin/product-detail-manager?pid=" + inputPid).forward(request, response);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } else if (action.equals("addVariant")) {
            String inputClName = request.getParameter("inputClName");
            String inputStock = request.getParameter("inputStock");
            String inputOldP = request.getParameter("inputOldP");
            String inputNewP = request.getParameter("inputNewP");

            String inputPid = request.getParameter("inputPid");
            String currentImg = "https://placehold.co/300x300?text=AuraSound";
            Part filePart = request.getPart("productImage");
            String finalImgUrl = currentImg;

            System.out.println("PID nhận được: [" + inputPid + "]");
            if (filePart != null && filePart.getSize() > 0) {
                Cloudinary cloudinary = CloundinaryLib.getCloudinary();
                byte[] fileBytes = filePart.getInputStream().readAllBytes();
                Map uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.emptyMap());

                finalImgUrl = uploadResult.get("secure_url").toString();
            }
            boolean a = false;
            try {
                a = service.addVariant(inputPid, inputClName, inputStock, inputOldP, inputNewP, finalImgUrl);
                if (a) {
                    session.setAttribute("msg", "success");
                    response.sendRedirect(request.getContextPath() + "/admin/product-detail-manager?pid=" + inputPid);
                } else {
                    session.setAttribute("msg", "fail");
                    response.sendRedirect(request.getContextPath() + "/admin/product-detail-manager?pid=" + inputPid);
                }
            } catch (SQLException e) {
                response.sendRedirect(request.getContextPath() + "/admin/product-detail-manager?pid=" + inputPid + "&msg=fail");
            }

        } else if (action.equals("updateOrder")) {
            String inputPid = request.getParameter("inputPid");
            String[] inputImageIds = request.getParameterValues("imgIds");
            String[] inputOrderIds = request.getParameterValues("orders");

            boolean a = false;

                a = service.updateOrderImage(inputImageIds, inputOrderIds);if (a) {
                    session.setAttribute("msg", "success");
                    response.sendRedirect(request.getContextPath() + "/admin/product-detail-manager?pid=" + inputPid);
                } else {
                    session.setAttribute("msg", "fail");
                    response.sendRedirect(request.getContextPath() + "/admin/product-detail-manager?pid=" + inputPid);
                }


        }
    }
}