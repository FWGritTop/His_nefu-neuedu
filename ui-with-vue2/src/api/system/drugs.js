import request from '@/utils/request'

// 查询成品药列表
export function listDrugs(query) {
    return request({
        url: '/system/drugs/list',
        method: 'get',
        params: query
    })
}

// 查询成品药详细
export function getDrugs(id) {
    return request({
        url: '/system/drugs/' + id,
        method: 'get'
    })
}

// 新增成品药
export function addDrugs(data) {
    return request({
        url: '/system/drugs',
        method: 'post',
        data: data
    })
}

// 修改成品药
export function updateDrugs(data) {
    return request({
        url: '/system/drugs',
        method: 'put',
        data: data
    })
}

// 删除成品药
export function delDrugs(id) {
    return request({
        url: '/system/drugs/' + id,
        method: 'delete'
    })
}
