/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package microvision;
import java.security.Security;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
/**
 *
 * @author Microvision
 */
public class MailService 
{
    public static void sendMail(String to,String from,String subject,String body)
    {
        try {

            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

            Properties props = new Properties();
            props.put("mail.smtp.host", "webmail.microvisiontechnology.com");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.port", "25");

            Session ses = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
            {

                protected PasswordAuthentication getPasswordAuthentication() 
                {
                    return new PasswordAuthentication("sales@microvisiontechnology.com", "MICRO@@@123");
                }
            });
            ses.setDebug(true);

            Message msg = new MimeMessage(ses);
            InternetAddress addressFrom = new InternetAddress("sales@microvisiontechnology.com");
            msg.setFrom(addressFrom);
            InternetAddress addressTo = new InternetAddress(to);
            msg.addRecipient(Message.RecipientType.TO, addressTo);

            msg.setSubject(subject);
            msg.setContent(body, "text/html");
            Transport.send(msg);

        } catch (Exception e) 
        {
            System.out.println(e);
        }
    }
    
}
