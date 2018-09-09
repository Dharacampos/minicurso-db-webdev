/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models;

/**
 *
 * @author paulo
 */
public class Disciplinas {
    private int id;
    private String descricao;
    private String sigla;
    private String ch;
    private int periodo;
    private String curso;

    public Disciplinas() {
    }

    
    public Disciplinas(int id, String descricao, String sigla, String ch, int periodo, String curso) {
        this.id = id;
        this.descricao = descricao;
        this.sigla = sigla;
        this.ch = ch;
        this.periodo = periodo;
        this.curso = curso;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getCh() {
        return ch;
    }

    public void setCh(String ch) {
        this.ch = ch;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }
    
    
    
    
}
