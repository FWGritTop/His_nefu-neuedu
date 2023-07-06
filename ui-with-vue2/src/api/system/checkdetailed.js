import request from '@/utils/request'

// 查询检查申请明细列表
export function listCheckdetailed(query) {
    return request({
        url: '/system/checkdetailed/list',
        method: 'get',
        params: query
    })
}

// 查询检查申请明细详细
export function getCheckdetailed(id) {
    return request({
        url: '/system/checkdetailed/' + id,
        method: 'get'
    })
}

// 新增检查申请明细
export function addCheckdetailed(data) {
    return request({
        url: '/system/checkdetailed',
        method: 'post',
        data: data
    })
}

// 修改检查申请明细
export function updateCheckdetailed(data) {
    return request({
        url: '/system/checkdetailed',
        method: 'put',
        data: data
    })
}

// 删除检查申请明细
export function delCheckdetailed(id) {
    return request({
        url: '/system/checkdetailed/' + id,
        method: 'delete'
    })
}
