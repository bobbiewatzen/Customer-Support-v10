<%--@elvariable id="sessions" type="java.util.List<com.wrox.site.chat.ChatSession>"--%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<template:basic htmlTitle="Support Chat" bodyTitle="Support Chat Requests">
  <c:choose>
    <c:when test="${fn:length(sessions) == 0}">
      <i>There are no pending support chat requests.</i>
    </c:when>
    <c:otherwise>
      Click on a chat request to accept it:<br /><br />
      <c:forEach items="${sessions}" var="s">
        <a href="javascript:void 0;" onclick="join(${s.sessionId});">${s.customerUsername}</a><br />
      </c:forEach>
    </c:otherwise>
  </c:choose>
  <script type="text/javascript" language="javascript">
    var join = function(id) {
    	postInvisibleForm(
    		'<c:url value="/chat/join/{id}" />'.replace('{id}', id), {});
    };
  </script>
</template:basic>