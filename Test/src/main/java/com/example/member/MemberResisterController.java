package com.example.member;


import com.example.dto.MemberDTO;
import com.example.service.MemberRegisterService;
import com.example.dao.MemberRegisterDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/member/register")
public class MemberResisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");

        String memberEmail = req.getParameter("memberEmail");
        String passwd = req.getParameter("passwd");
        String memberName = req.getParameter("memberName");
        String phone = req.getParameter("phone");

        System.out.println("memberEmail : " + memberEmail);
        System.out.println("passwd : " + passwd);
        System.out.println("memberName : " + memberName);
        System.out.println("phone : " + phone);

        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMemberEmail(memberEmail);
        memberDTO.setPasswd(passwd);
        memberDTO.setMemberName(memberName);
        memberDTO.setPhone(phone);

        MemberRegisterService memberRegisterService = MemberRegisterService.getInstance();
        boolean result = memberRegisterService.insertMember(memberDTO);;

    }
}
