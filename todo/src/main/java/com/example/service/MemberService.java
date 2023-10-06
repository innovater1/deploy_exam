package com.example.service;

import com.example.dao.MemberDAO;
import com.example.domain.MemberVO;
import com.example.dto.MemberDTO;
import com.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

@Log4j2
public enum MemberService {
    INSTANCE;

    private MemberDAO memberDAO;
    private ModelMapper modelMapper;

    MemberService() {
        memberDAO = new MemberDAO();
        modelMapper = MapperUtil.INSTANCE.getInstance();
    }

    public MemberDTO login(String mid, String mpw) throws Exception {
        MemberVO memberVO = memberDAO.getWithPassword(mid, mpw);

        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);

        return memberDTO;
    }
    public void modifyUuid(String mid, String uuid) throws Exception {
        // 자동 로그인을 사용하는 경우 임의의 문자열을 저장
        memberDAO.updateUuid(mid, uuid);
    }
    public MemberDTO getByUUID(String uuid) throws Exception {
        MemberVO memberVO = memberDAO.selectUuid(uuid);

        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);

        return memberDTO;
    }
}
