/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here
	if (globalContext == "cms") {
		config.filebrowserUploadUrl = getContextUrl("/proxy/CMS/file/uploadCKEditorImage");
	} else {
		config.filebrowserUploadUrl = getContextUrl("/file/uploadCKEditorImage");
	}
};
