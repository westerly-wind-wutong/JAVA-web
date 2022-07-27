package com;

public class EncryptAndDecrypt {
   String encrypt(String sourceString,String password) { //�����㷨
       char [] p= password.toCharArray();
       int n = p.length;
       char [] c = sourceString.toCharArray();
       int m = c.length;
       for(int k=0;k<m;k++){
            int mima=c[k]+p[k%n];       //����
            c[k]=(char)mima;
       }
       return new String(c);    //��������
    }
    String decrypt(String sourceString,String password) { //�����㷨
       char [] p= password.toCharArray();
       int n = p.length;
       char [] c = sourceString.toCharArray();
       int m = c.length;
       for(int k=0;k<m;k++){
           int mima=c[k]-p[k%n];       //����
           c[k]=(char)mima;
       }
       return new String(c);    //��������
   }
}



