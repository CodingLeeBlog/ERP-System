/**
 * @license Copyright (c) 2003-2023, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */
 
CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

config.extraPlugins = 'resize,wordcount,notification';
config.wordcount = {
    showParagraphs: false,
    showWordCount: false,
    showCharCount: true,
    countSpacesAsChars: true,
    countByTesAsChars: true,
    maxWordCount: 20,
    maxCharCount: 200,
    filter: new CKEDITOR.htmlParser.filter({
        elements: {
            div: function(elem) {
                if(elem.attributes.class == 'mediaembed') {
                    return false;
                }
            }
        }
    })
};
};