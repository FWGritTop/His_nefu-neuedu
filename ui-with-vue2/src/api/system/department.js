import request from '@/utils/request'

// 查询科室列表
export function listDepartment(query) {
    return request({
        url: '/system/department/list',
        method: 'get',
        params: query
    })
}

// 查询科室详细
export function getDepartment(id) {
    return request({
        url: '/system/department/' + id,
        method: 'get'
    })
}

// 新增科室
export function addDepartment(data) {
    return request({
        url: '/system/department',
        method: 'post',
        data: data
    })
}

// 修改科室
export function updateDepartment(data) {
    return request({
        url: '/system/department',
        method: 'put',
        data: data
    })
}

// 删除科室
export function delDepartment(id) {
    return request({
        url: '/system/department/' + id,
        method: 'delete'
    })
}
