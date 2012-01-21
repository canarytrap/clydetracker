// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function toggle_div(div_id)
{
    target = document.getElementById(div_id);

    if (target.style.display == '')
        target.style.display = 'block';
    else
        target.style.display = '';
    end    
}