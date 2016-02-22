global with sharing class DragAndDropFilesCtrl {
    public  static String recordId;
    public DragAndDropFilesCtrl(ApexPages.StandardController accountStdCtrl) {
    }

    @RemoteAction
    global static Map<String,Object> saveAttachment(Map<String,Object> file){
        system.debug('file---------->>>'+file);
        Attachment attach = new Attachment();
        String attachmentBody = String.valueOf(file.get('body'));
        attach.Body = EncodingUtil.base64Decode(attachmentBody);
        attach.Name = String.valueOf(file.get('name'));
        attach.ParentId = String.valueOf(file.get('parentId'));
        //attach.ContentType = String.valueOf(file.get('type'));
        insert attach;
        Map<String,Object> result = new Map<String,Object>();
        return result;
    }
}
