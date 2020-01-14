
// Hit tests for an element at a point in the webview
function elementForPosition(x, y) {
    return document.elementFromPoint(x, y);
}

// Collects info on the element
function getElementInfo(element) {
    
    // Check for null element
    if (element == null) {
        return null
    }
    
    // Get rect
    var rect = element.getBoundingClientRect()
    
    // Return info
    return { id: getUidForElement(element), x: rect.x, y: rect.y, width: rect.width, height: rect.height }
    
}

function createXPathFromElement(elm) {
    var allNodes = document.getElementsByTagName('*');
    for (var segs = []; elm && elm.nodeType == 1; elm = elm.parentNode)
    {
        if (elm.hasAttribute('id')) {
            var uniqueIdCount = 0;
            for (var n=0;n < allNodes.length;n++) {
                if (allNodes[n].hasAttribute('id') && allNodes[n].id == elm.id) uniqueIdCount++;
                if (uniqueIdCount > 1) break;
            };
            if ( uniqueIdCount == 1) {
                segs.unshift('id("' + elm.getAttribute('id') + '")');
                return segs.join('/');
            } else {
                segs.unshift(elm.localName.toLowerCase() + '[@id="' + elm.getAttribute('id') + '"]');
            }
        } else if (elm.hasAttribute('class')) {
            segs.unshift(elm.localName.toLowerCase() + '[@class="' + elm.getAttribute('class') + '"]');
        } else {
            for (i = 1, sib = elm.previousSibling; sib; sib = sib.previousSibling) {
                if (sib.localName == elm.localName)  i++; };
            segs.unshift(elm.localName.toLowerCase() + '[' + i + ']');
        };
    };
    return segs.length ? '/' + segs.join('/') : null;
};



//function getUidForElement(element) {
//
//    // Check if id exists for element
//    if (element.id !== '')
//        return tagName + '[@id="' + element.id + '"]'
//    else if (element.className !== '')
//        return tagName + '[@id="' + element.id + '"]'
//
//    // Return tag
//    if (element === document.body)
//        return element.tagName;
//
//    var ix = 0;
//    var siblings = element.parentNode.childNodes;
//    for (var i= 0; i< siblings.length; i++) {
//        var sibling= siblings[i];
//        if (sibling === element)
//            return getUidForElement(element.parentNode) + '/' + element.tagName + '[' + (ix+1) +  ']';
//        if (sibling.nodeType === 1 && sibling.tagName === element.tagName)
//            ix++;
//    }
//
//}
//

/// Generate UID for element
function getUidForElement(element) {
    
    // Check for cache
    if (element.getAttribute("uid") != null) {
        return element.getAttribute("uid")
    }
    
    // Generate uid
    var uid = ""
    var nextElement = element
    while (nextElement) {
        
        // Get parent
        var parent = nextElement.parentElement
        
        // Add tag
        var elementId = nextElement.tagName.toLowerCase()
        
        // Move up to parent for svgs
        if (elementId === "svg" || elementId === "path") {
            nextElement = parent
            continue
        }
        
        // Check siblings
        if (parent) {
            
            // Get siblings
            var siblings = parent.childNodes
            var similarSiblingCount = 0
            var index = 0
            for (var i = 0; i < siblings.length; i++) {
                var sibling = siblings[i]
                if (sibling.tagName === nextElement.tagName) {
                    if (sibling.isEqualNode(nextElement)) {
                        index = similarSiblingCount
                    }
                    similarSiblingCount++
                }
            }
            
            // Add to id
            if (similarSiblingCount > 1) {
                elementId += '[' + (index + 1) + ']'
            }
            
        }
        
        // Add class or id
        if (nextElement.className != "") {
            elementId += "."
            elementId += nextElement.className
        } else if (nextElement.id != "") {
            elementId += "."
            elementId += nextElement.id
        }
        
        // Add / if needed
        if (uid != "") {
            elementId += "/"
        }

        // Add element id
        uid = elementId + uid
        nextElement = parent
        
    }
    
    // Remove spaces
    uid = uid.replace(/\s/g, '')
    
    // Cache
    element.setAttribute("uid", uid)

    // Return
    return uid
    
}

// Exports HTML from page
function exportHTML() {
    return document.documentElement.outerHTML;
}

//// Generates a UID for the element.
//function getUidForElement(element) {
//
//    // Check for cache
//    if (element.getAttribute("uid") != null) {
//        return element.getAttribute("uid")
//    }
//
//    // Generate
//    var uid = ""
//    var parent = element
//    while (parent) {
//
//        // Get next parent parent
//        var newParent = parent.parentElement
//
//        // Add tag
//        var addition = parent.tagName.toLowerCase()
//
//        // Check position relative to siblings
//        if (newParent) {
//            var siblings = newParent.childNodes;
//            var index = 0;
//            for (var i= 0; i < siblings.length; i++) {
//                var sibling = siblings[i];
//                if (sibling === parent) {
//                    break
//                } else if (sibling.tagName === parent.tagName) {
//                    index += 1;
//                }
//
//            }
//            if (index > 0) {
//                addition += "[" + index + "]"
//            }
//        }
//
//        // Add class or id
//        if (parent.className != "") {
//            addition += "."
//            addition += parent.className
//        } else if (parent.id != "") {
//            addition += "."
//            addition += parent.id
//        }
//
//        // Add / if needed
//        if (uid != "") {
//            addition += "/"
//        }
//
//        // Append
//        uid = addition + uid
//        parent = newParent
//    }
//
//    // Remove spaces
//    uid = uid.replace(/\s/g, '')
//
//    // Cache
//    element.setAttribute("uid", uid)
//
//    // Return
//    return uid
//
//}

