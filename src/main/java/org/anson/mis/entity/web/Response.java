package org.anson.mis.entity.web;

/**
 * 响应
 */
public class Response {
    /**
     * 状态码
     */
    private String code;

    /**
     * 存储数据
     */
    private Object data;

    /**
     * 失败信息
     */
    private String msg;

    public static Response ok(){
        return new Response("200", null, "");
    }

    public static Response ok(Object data){
        return new Response("200", data, "");
    }

    public static Response clientError(){
        return new Response("499", null, "");
    }

    public static Response clientError(String msg){
        return new Response("499", null, msg);
    }

    public static Response serverError(String msg){
        return new Response("599", null, msg);
    }

    public Response() {
    }

    public Response(String code, Object data, String msg){
        this.code = code;
        this.data = data;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
