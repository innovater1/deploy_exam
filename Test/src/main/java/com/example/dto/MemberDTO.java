package com.example.dto;

public class MemberDTO {

    private String memberEmail;
    private String passwd;
    private String memberName;
    private String phone;
    private boolean agreeTerms;

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isAgreeTerms() {
        return agreeTerms;
    }

    public void setAgreeTerms(boolean agreeTerms) {
        this.agreeTerms = agreeTerms;
    }

    @Override
    public String toString() {
        return "MemberDTO{" +
                "memberEmail='" + memberEmail + '\'' +
                ", passwd='" + passwd + '\'' +
                ", memberName='" + memberName + '\'' +
                ", phone='" + phone + '\'' +
                ", agreeTerms=" + agreeTerms +
                '}';
    }
}
