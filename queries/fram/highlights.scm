;"abstr"    @keyword
"as"       @keyword
"data"     @keyword
"effect"   @keyword
;"effrow"   @keyword
"else"     @keyword
"end"      @keyword
;"extern"   @keyword
"finally"  @keyword
"fn"       @keyword
"handle"   @keyword
"handler"  @keyword
"if"       @keyword
"parameter" @keyword
"import"   @keyword
"in"       @keyword
;"label"    @keyword
"let"      @keyword
"match"    @keyword
"method"   @keyword
"module"   @keyword
"of"       @keyword
;"open"     @keyword
"pub"      @keyword
"rec"      @keyword
"return"   @keyword
; "then"     @keyword
"type"     @keyword
"with"     @keyword
"_"        @keyword
(uid_path) @type

(line_comment) @comment
(line_doc_comment) @comment
(block_comment) @comment
(block_comment_start) @comment
(block_comment_unfinished) @comment

(num) @number

(def_let
  . (lid) @variable)
(def_let
  . (ex_app . (lid) @function
              [(lid) @variable.parameter
              (ex_annot (lid) @variable.parameter)]*))

(def_method . (lid) @function.method)
(def_method . (ex_app . (lid) @function.method))
