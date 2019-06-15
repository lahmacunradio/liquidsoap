"use strict";function confirmDangerousAction(t){var e=$(t);e.is("a")||(e=e.closest("a"));var n="Are you sure?";e.data("confirm-title")&&(n=e.data("confirm-title"));var a=!0;(e.hasClass("btn-success")||e.hasClass("btn-outline-success"))&&(a=!1);var s=e.clone().children().remove().end().text();return swal({title:n,buttons:[!0,s],dangerMode:a})}function styleForm(t,e){var n=$.extend({},{placeholder:"Select...",no_results:"No results found!",advanced:"Advanced"},e),a=$(t);$(window).on("beforeunload",function(){return!1}),a.on("submit",function(){$(window).off("beforeunload")}),a.find("fieldset").addClass("form-group"),a.find("input:not(input[type=button],input[type=submit],input[type=reset],input[type=radio],input[type=checkbox]),textarea,select").addClass("form-control"),a.find("select").wrap('<div class="select" />').chosen({width:"100%",placeholder_text_single:n.placeholder,placeholder_text_multiple:n.placeholder,no_results_text:n.no_results}),autosize(a.find("textarea")),a.find("input[type=radio]").each(function(){$(this).addClass("custom-control-input"),$(this).closest(".form-field").addClass("mt-3"),$(this).next("label").addClass("custom-control-label").addBack().wrapAll('<div class="custom-control custom-radio" />')}),a.find("input[type=checkbox]").each(function(){$(this).addClass("custom-control-input"),$(this).closest(".form-field").addClass("mt-3"),$(this).next("label").addClass("custom-control-label").addBack().wrapAll('<div class="custom-control custom-checkbox" />')}),a.find(".help-block").addClass("form-text"),a.find(".help-block.form-error").parent().addClass("has-error"),a.find(".help-block.form-success").parent().addClass("has-success"),a.find(".help-block.form-warning").parent().addClass("has-warning"),a.find("label.advanced,fieldset.advanced legend").prepend('<span class="text-info">'+n.advanced+"</span> "),a.find("input[type=button],input[type=submit],input[type=reset]").addClass("btn m-t-10");var s=a.find(".has-error:visible");0<s.length&&$([document.documentElement,document.body]).animate({scrollTop:s.first().offset().top-$("#header").outerHeight()-15},1e3)}function notify(t,e,n){var a={type:e,allow_dismiss:!0,label:"Cancel",className:"btn-xs btn-inverse align-right",placement:{from:"top",align:"right"},delay:1e4,z_index:8,animate:{enter:"animated fadeIn",exit:"animated fadeOut"},offset:{x:20,y:85}};n&&(a.placement.from="top",a.placement.align="center",a.offset.y=20),$.notify({message:t},a)}$(function(){$("a.btn-danger,a.btn[data-confirm-title]").on("click",function(t){t.preventDefault();var e=$(this).attr("href");return confirmDangerousAction(t.target).then(function(t){t&&(window.location.href=e)}),!1})}),$("form button.file-upload").on("click",function(t){var e=$(this).siblings("input[type=file]")[0];$(e).trigger("click")}),$("form input[type=file]").change(function(t){var e=$(this).siblings(".file-name")[0];$(e).text($(this).val().split("\\").pop())});
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImNvbmZpcm0tZGFuZ2VyLmpzIiwiZm9ybS5qcyIsIm5vdGlmeS5qcyJdLCJuYW1lcyI6WyJjb25maXJtRGFuZ2Vyb3VzQWN0aW9uIiwiZWwiLCIkZWwiLCIkIiwiaXMiLCJjbG9zZXN0IiwiY29uZmlybVRpdGxlIiwiZGF0YSIsImRhbmdlck1vZGUiLCJoYXNDbGFzcyIsImJ1dHRvblRleHQiLCJjbG9uZSIsImNoaWxkcmVuIiwicmVtb3ZlIiwiZW5kIiwidGV4dCIsInN3YWwiLCJ0aXRsZSIsImJ1dHRvbnMiLCJzdHlsZUZvcm0iLCJmb3JtIiwidHJhbnNsYXRpb25zIiwibGFuZyIsImV4dGVuZCIsInBsYWNlaG9sZGVyIiwibm9fcmVzdWx0cyIsImFkdmFuY2VkIiwiJGZvcm0iLCJ3aW5kb3ciLCJvbiIsIm9mZiIsImZpbmQiLCJhZGRDbGFzcyIsIndyYXAiLCJjaG9zZW4iLCJ3aWR0aCIsInBsYWNlaG9sZGVyX3RleHRfc2luZ2xlIiwicGxhY2Vob2xkZXJfdGV4dF9tdWx0aXBsZSIsIm5vX3Jlc3VsdHNfdGV4dCIsImF1dG9zaXplIiwiZWFjaCIsInRoaXMiLCJuZXh0IiwiYWRkQmFjayIsIndyYXBBbGwiLCJwYXJlbnQiLCJwcmVwZW5kIiwiZXJyb3JfZmllbGRzIiwibGVuZ3RoIiwiZG9jdW1lbnQiLCJkb2N1bWVudEVsZW1lbnQiLCJib2R5IiwiYW5pbWF0ZSIsInNjcm9sbFRvcCIsImZpcnN0Iiwib2Zmc2V0IiwidG9wIiwib3V0ZXJIZWlnaHQiLCJub3RpZnkiLCJtZXNzYWdlIiwidHlwZSIsIm1pbmltYWxfbGF5b3V0IiwiZ3Jvd2xTZXR0aW5ncyIsImFsbG93X2Rpc21pc3MiLCJsYWJlbCIsImNsYXNzTmFtZSIsInBsYWNlbWVudCIsImZyb20iLCJhbGlnbiIsImRlbGF5Iiwiel9pbmRleCIsImVudGVyIiwiZXhpdCIsIngiLCJ5IiwiZSIsInByZXZlbnREZWZhdWx0IiwibGlua1VybCIsImF0dHIiLCJ0YXJnZXQiLCJ0aGVuIiwidmFsdWUiLCJsb2NhdGlvbiIsImhyZWYiLCJpbnB1dEVsZW1lbnQiLCJzaWJsaW5ncyIsInRyaWdnZXIiLCJjaGFuZ2UiLCJmaWxlTmFtZUVsZW1lbnQiLCJ2YWwiLCJzcGxpdCIsInBvcCJdLCJtYXBwaW5ncyI6ImFBQUEsU0FBU0EsdUJBQXVCQyxHQUM1QixJQUFJQyxFQUFNQyxFQUFFRixHQUVQQyxFQUFJRSxHQUFHLE9BQ1JGLEVBQU1BLEVBQUlHLFFBQVEsTUFHdEIsSUFBSUMsRUFBZSxnQkFDZkosRUFBSUssS0FBSyxtQkFDVEQsRUFBZUosRUFBSUssS0FBSyxrQkFHNUIsSUFBSUMsR0FBYSxHQUNiTixFQUFJTyxTQUFTLGdCQUFrQlAsRUFBSU8sU0FBUywwQkFDNUNELEdBQWEsR0FLakIsSUFBSUUsRUFBYVIsRUFBSVMsUUFBUUMsV0FBV0MsU0FBU0MsTUFBTUMsT0FFdkQsT0FBT0MsS0FBSyxDQUNSQyxNQUFPWCxFQUNQWSxRQUFTLEVBQUMsRUFBTVIsR0FDaEJGLFdBQVlBLElDeEJwQixTQUFTVyxVQUFVQyxFQUFNQyxHQUVyQixJQUFJQyxFQUFPbkIsRUFBRW9CLE9BQU8sR0FBSSxDQUNwQkMsWUFBZSxZQUNmQyxXQUFjLG9CQUNkQyxTQUFZLFlBQ2JMLEdBRUNNLEVBQVF4QixFQUFFaUIsR0FFZGpCLEVBQUV5QixRQUFRQyxHQUFHLGVBQWdCLFdBQ3pCLE9BQU8sSUFHWEYsRUFBTUUsR0FBRyxTQUFVLFdBQ2YxQixFQUFFeUIsUUFBUUUsSUFBSSxrQkFHbEJILEVBQU1JLEtBQUssWUFBWUMsU0FBUyxjQUVoQ0wsRUFBTUksS0FBSyw2SEFBNkhDLFNBQVMsZ0JBRWpKTCxFQUFNSSxLQUFLLFVBQVVFLEtBQUssMEJBQTBCQyxPQUFPLENBQ3ZEQyxNQUFPLE9BQ1BDLHdCQUF5QmQsRUFBS0UsWUFDOUJhLDBCQUEyQmYsRUFBS0UsWUFDaENjLGdCQUFpQmhCLEVBQUtHLGFBRzFCYyxTQUFTWixFQUFNSSxLQUFLLGFBRXBCSixFQUFNSSxLQUFLLHFCQUFxQlMsS0FBSyxXQUNqQ3JDLEVBQUVzQyxNQUFNVCxTQUFTLHdCQUNqQjdCLEVBQUVzQyxNQUFNcEMsUUFBUSxlQUFlMkIsU0FBUyxRQUN4QzdCLEVBQUVzQyxNQUFNQyxLQUFLLFNBQVNWLFNBQVMsd0JBQXdCVyxVQUFVQyxRQUFRLGlEQUU3RWpCLEVBQU1JLEtBQUssd0JBQXdCUyxLQUFLLFdBQ3BDckMsRUFBRXNDLE1BQU1ULFNBQVMsd0JBQ2pCN0IsRUFBRXNDLE1BQU1wQyxRQUFRLGVBQWUyQixTQUFTLFFBRXhDN0IsRUFBRXNDLE1BQU1DLEtBQUssU0FDUlYsU0FBUyx3QkFDVFcsVUFDQUMsUUFBUSxvREFHakJqQixFQUFNSSxLQUFLLGVBQWVDLFNBQVMsYUFDbkNMLEVBQU1JLEtBQUssMEJBQTBCYyxTQUFTYixTQUFTLGFBQ3ZETCxFQUFNSSxLQUFLLDRCQUE0QmMsU0FBU2IsU0FBUyxlQUN6REwsRUFBTUksS0FBSyw0QkFBNEJjLFNBQVNiLFNBQVMsZUFHekRMLEVBQU1JLEtBQUssMkNBQ05lLFFBQVEsMkJBQTJCeEIsRUFBS0ksU0FBUyxZQUV0REMsRUFBTUksS0FBSywyREFBMkRDLFNBQVMsY0FHL0UsSUFBSWUsRUFBZXBCLEVBQU1JLEtBQUssc0JBQ0osRUFBdEJnQixFQUFhQyxRQUNiN0MsRUFBRSxDQUFDOEMsU0FBU0MsZ0JBQWlCRCxTQUFTRSxPQUFPQyxRQUFRLENBQ2pEQyxVQUFXTixFQUFhTyxRQUFRQyxTQUFTQyxJQUFNckQsRUFBRSxXQUFXc0QsY0FBZ0IsSUFDN0UsS0M5RFgsU0FBU0MsT0FBT0MsRUFBU0MsRUFBTUMsR0FFM0IsSUFBSUMsRUFBZ0IsQ0FDaEJGLEtBQU1BLEVBQ05HLGVBQWUsRUFDZkMsTUFBTyxTQUNQQyxVQUFXLGlDQUNYQyxVQUFXLENBQ1BDLEtBQU0sTUFDTkMsTUFBTyxTQUVYQyxNQUFPLElBQ1BDLFFBQVMsRUFDVGxCLFFBQVMsQ0FDTG1CLE1BQU8sa0JBQ1BDLEtBQU0sb0JBRVZqQixPQUFRLENBQ0prQixFQUFHLEdBQ0hDLEVBQUcsS0FJUGIsSUFDQUMsRUFBY0ksVUFBVUMsS0FBTyxNQUMvQkwsRUFBY0ksVUFBVUUsTUFBUSxTQUNoQ04sRUFBY1AsT0FBT21CLEVBQUksSUFHN0J2RSxFQUFFdUQsT0FBTyxDQUFFQyxRQUFTQSxHQUFXRyxHRkRuQzNELEVBQUUsV0FFRUEsRUFBRSwwQ0FBMEMwQixHQUFHLFFBQVMsU0FBUzhDLEdBQzdEQSxFQUFFQyxpQkFFRixJQUFNQyxFQUFVMUUsRUFBRXNDLE1BQU1xQyxLQUFLLFFBTTdCLE9BTEE5RSx1QkFBdUIyRSxFQUFFSSxRQUFRQyxLQUFLLFNBQUNDLEdBQy9CQSxJQUNBckQsT0FBT3NELFNBQVNDLEtBQU9OLE1BR3hCLE1DNEJmMUUsRUFBRSwyQkFBMkIwQixHQUFHLFFBQVMsU0FBUzhDLEdBQzlDLElBQUlTLEVBQWVqRixFQUFFc0MsTUFBTTRDLFNBQVMsb0JBQW9CLEdBRXhEbEYsRUFBRWlGLEdBQWNFLFFBQVEsV0FHNUJuRixFQUFFLHlCQUF5Qm9GLE9BQU8sU0FBVVosR0FDeEMsSUFBSWEsRUFBa0JyRixFQUFFc0MsTUFBTTRDLFNBQVMsY0FBYyxHQUNyRGxGLEVBQUVxRixHQUFpQnpFLEtBQUtaLEVBQUVzQyxNQUFNZ0QsTUFBTUMsTUFBTSxNQUFNQyIsImZpbGUiOiJhcHAuanMiLCJzb3VyY2VzQ29udGVudCI6WyJmdW5jdGlvbiBjb25maXJtRGFuZ2Vyb3VzQWN0aW9uKGVsKSB7XG4gICAgbGV0ICRlbCA9ICQoZWwpO1xuXG4gICAgaWYgKCEkZWwuaXMoJ2EnKSkge1xuICAgICAgICAkZWwgPSAkZWwuY2xvc2VzdCgnYScpO1xuICAgIH1cblxuICAgIGxldCBjb25maXJtVGl0bGUgPSAnQXJlIHlvdSBzdXJlPyc7XG4gICAgaWYgKCRlbC5kYXRhKCdjb25maXJtLXRpdGxlJykpIHtcbiAgICAgICAgY29uZmlybVRpdGxlID0gJGVsLmRhdGEoJ2NvbmZpcm0tdGl0bGUnKTtcbiAgICB9XG5cbiAgICBsZXQgZGFuZ2VyTW9kZSA9IHRydWU7XG4gICAgaWYgKCRlbC5oYXNDbGFzcygnYnRuLXN1Y2Nlc3MnKSB8fCAkZWwuaGFzQ2xhc3MoJ2J0bi1vdXRsaW5lLXN1Y2Nlc3MnKSkge1xuICAgICAgICBkYW5nZXJNb2RlID0gZmFsc2U7XG4gICAgfVxuXG4gICAgLy8galF1ZXJ5IHRyaWNrIHRvIHB1bGwgYW4gaXRlbSdzIHRleHQgd2l0aG91dCBpbm5lciBIVE1MIGVsZW1lbnRzLlxuICAgIC8vIGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzg2MjQ1OTIvaG93LXRvLWdldC1vbmx5LWRpcmVjdC10ZXh0LXdpdGhvdXQtdGFncy13aXRoLWpxdWVyeS1pbi1odG1sXG4gICAgbGV0IGJ1dHRvblRleHQgPSAkZWwuY2xvbmUoKS5jaGlsZHJlbigpLnJlbW92ZSgpLmVuZCgpLnRleHQoKTtcblxuICAgIHJldHVybiBzd2FsKHtcbiAgICAgICAgdGl0bGU6IGNvbmZpcm1UaXRsZSxcbiAgICAgICAgYnV0dG9uczogW3RydWUsIGJ1dHRvblRleHRdLFxuICAgICAgICBkYW5nZXJNb2RlOiBkYW5nZXJNb2RlXG4gICAgfSk7XG59XG5cbiQoZnVuY3Rpb24oKSB7XG5cbiAgICAkKCdhLmJ0bi1kYW5nZXIsYS5idG5bZGF0YS1jb25maXJtLXRpdGxlXScpLm9uKCdjbGljaycsIGZ1bmN0aW9uKGUpIHtcbiAgICAgICAgZS5wcmV2ZW50RGVmYXVsdCgpO1xuXG4gICAgICAgIGNvbnN0IGxpbmtVcmwgPSAkKHRoaXMpLmF0dHIoJ2hyZWYnKTtcbiAgICAgICAgY29uZmlybURhbmdlcm91c0FjdGlvbihlLnRhcmdldCkudGhlbigodmFsdWUpID0+IHtcbiAgICAgICAgICAgIGlmICh2YWx1ZSkge1xuICAgICAgICAgICAgICAgIHdpbmRvdy5sb2NhdGlvbi5ocmVmID0gbGlua1VybDtcbiAgICAgICAgICAgIH1cbiAgICAgICAgfSk7XG4gICAgICAgIHJldHVybiBmYWxzZTtcbiAgICB9KTtcblxufSk7XG5cbiIsImZ1bmN0aW9uIHN0eWxlRm9ybShmb3JtLCB0cmFuc2xhdGlvbnMpIHtcclxuXHJcbiAgICB2YXIgbGFuZyA9ICQuZXh0ZW5kKHt9LCB7XHJcbiAgICAgICAgXCJwbGFjZWhvbGRlclwiOiBcIlNlbGVjdC4uLlwiLFxyXG4gICAgICAgIFwibm9fcmVzdWx0c1wiOiBcIk5vIHJlc3VsdHMgZm91bmQhXCIsXHJcbiAgICAgICAgXCJhZHZhbmNlZFwiOiBcIkFkdmFuY2VkXCJcclxuICAgIH0sIHRyYW5zbGF0aW9ucyk7XHJcblxyXG4gICAgdmFyICRmb3JtID0gJChmb3JtKTtcclxuXHJcbiAgICAkKHdpbmRvdykub24oJ2JlZm9yZXVubG9hZCcsIGZ1bmN0aW9uKCkge1xyXG4gICAgICAgIHJldHVybiBmYWxzZTtcclxuICAgIH0pO1xyXG5cclxuICAgICRmb3JtLm9uKCdzdWJtaXQnLCBmdW5jdGlvbigpIHtcclxuICAgICAgICAkKHdpbmRvdykub2ZmKCdiZWZvcmV1bmxvYWQnKTtcclxuICAgIH0pO1xyXG5cclxuICAgICRmb3JtLmZpbmQoJ2ZpZWxkc2V0JykuYWRkQ2xhc3MoJ2Zvcm0tZ3JvdXAnKTtcclxuXHJcbiAgICAkZm9ybS5maW5kKCdpbnB1dDpub3QoaW5wdXRbdHlwZT1idXR0b25dLGlucHV0W3R5cGU9c3VibWl0XSxpbnB1dFt0eXBlPXJlc2V0XSxpbnB1dFt0eXBlPXJhZGlvXSxpbnB1dFt0eXBlPWNoZWNrYm94XSksdGV4dGFyZWEsc2VsZWN0JykuYWRkQ2xhc3MoJ2Zvcm0tY29udHJvbCcpO1xyXG5cclxuICAgICRmb3JtLmZpbmQoJ3NlbGVjdCcpLndyYXAoJzxkaXYgY2xhc3M9XCJzZWxlY3RcIiAvPicpLmNob3Nlbih7XHJcbiAgICAgICAgd2lkdGg6IFwiMTAwJVwiLFxyXG4gICAgICAgIHBsYWNlaG9sZGVyX3RleHRfc2luZ2xlOiBsYW5nLnBsYWNlaG9sZGVyLFxyXG4gICAgICAgIHBsYWNlaG9sZGVyX3RleHRfbXVsdGlwbGU6IGxhbmcucGxhY2Vob2xkZXIsXHJcbiAgICAgICAgbm9fcmVzdWx0c190ZXh0OiBsYW5nLm5vX3Jlc3VsdHNcclxuICAgIH0pO1xyXG5cclxuICAgIGF1dG9zaXplKCRmb3JtLmZpbmQoJ3RleHRhcmVhJykpO1xyXG5cclxuICAgICRmb3JtLmZpbmQoJ2lucHV0W3R5cGU9cmFkaW9dJykuZWFjaChmdW5jdGlvbigpIHtcclxuICAgICAgICAkKHRoaXMpLmFkZENsYXNzKCdjdXN0b20tY29udHJvbC1pbnB1dCcpO1xyXG4gICAgICAgICQodGhpcykuY2xvc2VzdCgnLmZvcm0tZmllbGQnKS5hZGRDbGFzcygnbXQtMycpO1xyXG4gICAgICAgICQodGhpcykubmV4dCgnbGFiZWwnKS5hZGRDbGFzcygnY3VzdG9tLWNvbnRyb2wtbGFiZWwnKS5hZGRCYWNrKCkud3JhcEFsbCgnPGRpdiBjbGFzcz1cImN1c3RvbS1jb250cm9sIGN1c3RvbS1yYWRpb1wiIC8+Jyk7XHJcbiAgICB9KTtcclxuICAgICRmb3JtLmZpbmQoJ2lucHV0W3R5cGU9Y2hlY2tib3hdJykuZWFjaChmdW5jdGlvbigpIHtcclxuICAgICAgICAkKHRoaXMpLmFkZENsYXNzKCdjdXN0b20tY29udHJvbC1pbnB1dCcpO1xyXG4gICAgICAgICQodGhpcykuY2xvc2VzdCgnLmZvcm0tZmllbGQnKS5hZGRDbGFzcygnbXQtMycpO1xyXG5cclxuICAgICAgICAkKHRoaXMpLm5leHQoJ2xhYmVsJylcclxuICAgICAgICAgICAgLmFkZENsYXNzKCdjdXN0b20tY29udHJvbC1sYWJlbCcpXHJcbiAgICAgICAgICAgIC5hZGRCYWNrKClcclxuICAgICAgICAgICAgLndyYXBBbGwoJzxkaXYgY2xhc3M9XCJjdXN0b20tY29udHJvbCBjdXN0b20tY2hlY2tib3hcIiAvPicpO1xyXG4gICAgfSk7XHJcblxyXG4gICAgJGZvcm0uZmluZCgnLmhlbHAtYmxvY2snKS5hZGRDbGFzcygnZm9ybS10ZXh0Jyk7XHJcbiAgICAkZm9ybS5maW5kKCcuaGVscC1ibG9jay5mb3JtLWVycm9yJykucGFyZW50KCkuYWRkQ2xhc3MoJ2hhcy1lcnJvcicpO1xyXG4gICAgJGZvcm0uZmluZCgnLmhlbHAtYmxvY2suZm9ybS1zdWNjZXNzJykucGFyZW50KCkuYWRkQ2xhc3MoJ2hhcy1zdWNjZXNzJyk7XHJcbiAgICAkZm9ybS5maW5kKCcuaGVscC1ibG9jay5mb3JtLXdhcm5pbmcnKS5wYXJlbnQoKS5hZGRDbGFzcygnaGFzLXdhcm5pbmcnKTtcclxuXHJcbiAgICAvLyBub2luc3BlY3Rpb24gSlNBbm5vdGF0b3JcclxuICAgICRmb3JtLmZpbmQoJ2xhYmVsLmFkdmFuY2VkLGZpZWxkc2V0LmFkdmFuY2VkIGxlZ2VuZCcpXHJcbiAgICAgICAgLnByZXBlbmQoJzxzcGFuIGNsYXNzPVwidGV4dC1pbmZvXCI+JytsYW5nLmFkdmFuY2VkKyc8L3NwYW4+ICcpO1xyXG5cclxuICAgICRmb3JtLmZpbmQoJ2lucHV0W3R5cGU9YnV0dG9uXSxpbnB1dFt0eXBlPXN1Ym1pdF0saW5wdXRbdHlwZT1yZXNldF0nKS5hZGRDbGFzcygnYnRuIG0tdC0xMCcpO1xyXG5cclxuICAgIC8vIFNjcm9sbCB0byBlcnJvcnMuXHJcbiAgICB2YXIgZXJyb3JfZmllbGRzID0gJGZvcm0uZmluZCgnLmhhcy1lcnJvcjp2aXNpYmxlJyk7XHJcbiAgICBpZiAoZXJyb3JfZmllbGRzLmxlbmd0aCA+IDApIHtcclxuICAgICAgICAkKFtkb2N1bWVudC5kb2N1bWVudEVsZW1lbnQsIGRvY3VtZW50LmJvZHldKS5hbmltYXRlKHtcclxuICAgICAgICAgICAgc2Nyb2xsVG9wOiBlcnJvcl9maWVsZHMuZmlyc3QoKS5vZmZzZXQoKS50b3AgLSAkKCcjaGVhZGVyJykub3V0ZXJIZWlnaHQoKSAtIDE1XHJcbiAgICAgICAgfSwgMTAwMCk7XHJcbiAgICB9XHJcblxyXG59XHJcblxyXG4kKCdmb3JtIGJ1dHRvbi5maWxlLXVwbG9hZCcpLm9uKCdjbGljaycsIGZ1bmN0aW9uKGUpIHtcclxuICAgIGxldCBpbnB1dEVsZW1lbnQgPSAkKHRoaXMpLnNpYmxpbmdzKCdpbnB1dFt0eXBlPWZpbGVdJylbMF07XHJcblxyXG4gICAgJChpbnB1dEVsZW1lbnQpLnRyaWdnZXIoJ2NsaWNrJyk7XHJcbn0pO1xyXG5cclxuJCgnZm9ybSBpbnB1dFt0eXBlPWZpbGVdJykuY2hhbmdlKGZ1bmN0aW9uIChlKXtcclxuICAgIGxldCBmaWxlTmFtZUVsZW1lbnQgPSAkKHRoaXMpLnNpYmxpbmdzKCcuZmlsZS1uYW1lJylbMF07XHJcbiAgICAkKGZpbGVOYW1lRWxlbWVudCkudGV4dCgkKHRoaXMpLnZhbCgpLnNwbGl0KCdcXFxcJykucG9wKCkpO1xyXG59KTtcclxuIiwiZnVuY3Rpb24gbm90aWZ5KG1lc3NhZ2UsIHR5cGUsIG1pbmltYWxfbGF5b3V0KSB7XHJcblxyXG4gICAgdmFyIGdyb3dsU2V0dGluZ3MgPSB7XHJcbiAgICAgICAgdHlwZTogdHlwZSxcclxuICAgICAgICBhbGxvd19kaXNtaXNzOiB0cnVlLFxyXG4gICAgICAgIGxhYmVsOiAnQ2FuY2VsJyxcclxuICAgICAgICBjbGFzc05hbWU6ICdidG4teHMgYnRuLWludmVyc2UgYWxpZ24tcmlnaHQnLFxyXG4gICAgICAgIHBsYWNlbWVudDoge1xyXG4gICAgICAgICAgICBmcm9tOiAndG9wJyxcclxuICAgICAgICAgICAgYWxpZ246ICdyaWdodCdcclxuICAgICAgICB9LFxyXG4gICAgICAgIGRlbGF5OiAxMDAwMCxcclxuICAgICAgICB6X2luZGV4OiA4LFxyXG4gICAgICAgIGFuaW1hdGU6IHtcclxuICAgICAgICAgICAgZW50ZXI6ICdhbmltYXRlZCBmYWRlSW4nLFxyXG4gICAgICAgICAgICBleGl0OiAnYW5pbWF0ZWQgZmFkZU91dCdcclxuICAgICAgICB9LFxyXG4gICAgICAgIG9mZnNldDoge1xyXG4gICAgICAgICAgICB4OiAyMCxcclxuICAgICAgICAgICAgeTogODVcclxuICAgICAgICB9XHJcbiAgICB9O1xyXG5cclxuICAgIGlmIChtaW5pbWFsX2xheW91dCkge1xyXG4gICAgICAgIGdyb3dsU2V0dGluZ3MucGxhY2VtZW50LmZyb20gPSAndG9wJztcclxuICAgICAgICBncm93bFNldHRpbmdzLnBsYWNlbWVudC5hbGlnbiA9ICdjZW50ZXInO1xyXG4gICAgICAgIGdyb3dsU2V0dGluZ3Mub2Zmc2V0LnkgPSAyMDtcclxuICAgIH1cclxuXHJcbiAgICAkLm5vdGlmeSh7IG1lc3NhZ2U6IG1lc3NhZ2UgfSwgZ3Jvd2xTZXR0aW5ncyk7XHJcblxyXG59XHJcbiJdfQ==
