import request from '@/utils/request'

// 查询挂号信息列表
export function listRegister(query) {
    return request({
        url: '/system/register/list',
        method: 'get',
        params: query
    })
}

// 查询挂号信息详细
export function getRegister(id) {
    return request({
        url: '/system/register/' + id,
        method: 'get'
    })
}

// 新增挂号信息
export function addRegister(data) {
    console.log(data);
    return request({
        url: '/system/register',
        method: 'post',
        data: data
    })
}

// 修改挂号信息
export function updateRegister(data) {
    return request({
        url: '/system/register',
        method: 'put',
        data: data
    })
}

// 删除挂号信息
export function delRegister(id) {
    return request({
        url: '/system/register/' + id,
        method: 'delete'
    })
}
