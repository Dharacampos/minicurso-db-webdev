/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models;

import java.util.List;

/**
 *
 * @author paulo
 */
public class Estudante {
    
    private int id;
    private String nome;
    private String cpf;
    private String endereco;
    private String curso;
    private List<String> disciplinas_mat;

    public Estudante() {
    }

    public Estudante(int id, String nome, String cpf, String endereco, String curso, List<String> disciplinas_mat) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.curso = curso;
        this.disciplinas_mat = disciplinas_mat;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }    

    public List<String> getDisciplinas_mat() {
        return disciplinas_mat;
    }

    public void setDisciplinas_mat(List<String> disciplinas_mat) {
        this.disciplinas_mat = disciplinas_mat;
    }
    
    
}
