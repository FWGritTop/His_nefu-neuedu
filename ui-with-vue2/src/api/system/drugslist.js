import request from '@/utils/request'

// 查询成品药列表
export function listDrugslist(query) {
    return request({
        url: '/system/drugslist/list',
        method: 'get',
        params: query
    })
}

// 查询成品药详细
export function getDrugslist(id) {
    return request({
        url: '/system/drugslist/' + id,
        method: 'get'
    })
}

// 新增成品药
export function addDrugslist(data) {
    return request({
        url: '/system/drugslist',
        method: 'post',
        data: data
    })
}

// 修改成品药
export function updateDrugslist(data) {
    return request({
        url: '/system/drugslist',
        method: 'put',
        data: data
    })
}

// 删除成品药
export function delDrugslist(id) {
    return request({
        url: '/system/drugslist/' + id,
        method: 'delete'
    })
}
