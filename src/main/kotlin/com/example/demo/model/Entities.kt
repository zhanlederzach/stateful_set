package com.example.demo.model

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

//@Entity
//class User(
//        var login: String,
//        var firstname: String,
//        var lastname: String,
//        var description: String? = null,
//        @Id @GeneratedValue var id: Long? = null)

class Task(
        @Id @GeneratedValue var id: Int,
        var text: String,
        var day: String,
        var reminder: Boolean
)

class BaseResponse(
        var status: Status,
        var code: Int
)

enum class Status {
    OK, ERROR
}