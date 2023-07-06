import request from '@/utils/request'

export function upload(formData) {
    return request({
        url: "/file/upload",
        method: "post",
        data: formData,
    })
}

export function getfile(filename) {
    return request({
        url: `/file/getfile`,
        method: 'get',
        params: {"filename":filename},
        responseType: 'arrayBuffer',
        isExport: true,
    })
}