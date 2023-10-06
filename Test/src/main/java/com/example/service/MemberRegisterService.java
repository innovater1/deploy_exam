package com.example.service;

import com.example.dao.MemberRegisterDAO;
import com.example.dto.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MemberRegisterService {

    private static MemberRegisterService instance;
    private MemberRegisterService() {

    }

    public static MemberRegisterService getInstance() {
        if (instance == null)
            instance = new MemberRegisterService();
        return instance;
    }

    public void register(HttpServletRequest request) {
        MemberRegisterDAO dao = MemberRegisterDAO.getInstance();
        HttpSession session = request.getSession(); // request에 session 가져오기

        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMemberEmail((String) session.getAttribute("memberEmail"));
        memberDTO.setPasswd(request.getParameter("passwd"));
        memberDTO.setMemberName(request.getParameter("memberName"));
        memberDTO.setPhone(request.getParameter("phone"));

        System.out.println(request.getParameter("memberEmail"));
        System.out.println(request.getParameter("passwd"));
        System.out.println(request.getParameter("memberName"));
        System.out.println(request.getParameter("phone"));

        dao.insertMember(memberDTO);
    }

    public boolean insertMember(MemberDTO memberDTO) {
        MemberRegisterDAO dao = MemberRegisterDAO.getInstance();
        return dao.insertMember(memberDTO);
    }
}
