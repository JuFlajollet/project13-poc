import { Component, inject } from '@angular/core';
import { RxStompService } from '../../rx-stomp.service';
import { Message } from '@stomp/stompjs';
import { Subscription } from 'rxjs';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-tchat',
  templateUrl: './tchat.component.html',
  styleUrl: './tchat.component.scss'
})
export class TchatComponent {

  private formBuilder = inject(FormBuilder);

  messageForm: FormGroup = this.formBuilder.group({
    userName: [
      '',
      [
        Validators.required,
        Validators.minLength(3),
        Validators.maxLength(40)
      ]
    ],
    message: [
      '',
      [
        Validators.required,
        Validators.minLength(1),
        Validators.maxLength(280)
      ]
    ],  
  });

  receivedMessages: string[] = [];
  private topicSubscription: Subscription;

  constructor(private rxStompService: RxStompService, 
    private datePipe: DatePipe) {
    this.topicSubscription = this.rxStompService.watch('/topic/tchating').subscribe((message: Message) => {
      console.log(message.body);
      this.receivedMessages.push(message.body);
    });
  }

  ngOnDestroy() {
    this.topicSubscription.unsubscribe();
  }

  onSendMessage() {
    const date = this.datePipe.transform(new Date(), 'dd-MM-yy HH:mm');
    const message = `[${date}] ${this.messageForm.value.userName}: ${this.messageForm.value.message}`;
    this.rxStompService.publish({ destination: '/topic/tchating', body: message });
  }
}
