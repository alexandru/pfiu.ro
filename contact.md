---
layout: default
title: Contact
---

<div id="contact">
  <h1 class="pageTitle">Contact</h1>
  <!--sse-->
  <div class="contactContent">
    <p class="intro">Ne puteți contacta folosind adresa de email:</p>
    <a href="javascript:window.location.href = 'mailto:' + ['contact', 'm9.pfiu.ro'].join('@')">
      contact<!---@--->@<!----@-@---->m9.pfiu.ro
    </a>
    <p class="small-note">
      Această adresă este schimbată periodic.
    </p>
    <p>
      Sau folosiți următorul formular:
    </p>
  </div>
  <form action="https://formspree.io/{{ site.social.email }}" method="POST">
    <label for="name">Nume</label>
    <input type="text" id="name" name="name" class="full-width"><br>
    <label for="email">Adresă Email</label>
    <input type="email" id="email" name="_replyto" class="full-width"><br>
    <label for="message">Mesaj</label>
    <textarea name="message" id="message" cols="30" rows="10" class="full-width"></textarea><br>
    <input type="submit" value="Trimite" class="button">
  </form>
  <!--/sse-->
</div>
