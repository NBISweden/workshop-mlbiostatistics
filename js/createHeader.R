# Modified from https://statnmap.com/2017-11-13-enable-code-folding-in-bookdown-and-blogdown/

codejs <- readr::read_lines("codefolding.js")
collapsejs <- readr::read_lines("collapse.js")
transitionjs <- readr::read_lines("transition.js")
dropdownjs <- readr::read_lines("dropdown.js")

htmlhead <- c(
  paste('
  
<script>',
        paste(transitionjs, collapse = "\n"),
        '</script>
<script>',
        paste(collapsejs, collapse = "\n"),
        '</script>
<script>',
        paste(codejs, collapse = "\n"),
        '</script>
<script>',
        paste(dropdownjs, collapse = "\n"),
        '</script>
<style type="text/css">
 .code-folding-btn { margin-bottom: 4px; }
 .row { display: flex; }
 .collapse { display: none; }
 .in { display:block }
# .pull-right > .dropdown-menu {
#     right: 0;
#     left: auto;
# }
# .open > .dropdown-menu {
#     display: block;
# }
# .dropdown-menu {
#     position: absolute;
#     top: 100%;
#     left: 0;
#     z-index: 1000;
#     display: none;
#     float: left;
#     min-width: 160px;
#     padding: 5px 0;
#     margin: 2px 0 0;
#     font-size: 14px;
#     text-align: left;
#     list-style: none;
#     background-color: #fff;
#     -webkit-background-clip: padding-box;
#     background-clip: padding-box;
#     border: 1px solid #ccc;
#     border: 1px solid rgba(0,0,0,.15);
#     border-radius: 4px;
#     -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
#     box-shadow: 0 6px 12px rgba(0,0,0,.175);
# }
</style>
<script>
$(document).ready(function () {
  window.initializeCodeFolding("show" === "hide");
});
</script>
', sep = "\n") 
  #,
  #  paste0('
  #<script>
  #document.write(\'<div class="btn-group pull-right" style="position: absolute; top: 20%; right: 2%; #z-index: 200"><button type="button" class="btn btn-default btn-xs dropdown-toggle" #data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" #data-_extension-text-contrast=""><span>Code</span> <span class="caret"></span></button><ul #class="dropdown-menu" style="min-width: 50px;"><li><a id="rmd-show-all-code" href="#">Show All #Code</a></li><li><a id="rmd-hide-all-code" href="#">Hide All Code</a></li></ul></div>\')
  #</script>
  #')
)

readr::write_lines(htmlhead, file = "header.html")


