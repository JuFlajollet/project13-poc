import { Component } from '@angular/core';
import { RxStompService } from '../../rx-stomp.service';
import { Message } from '@stomp/stompjs';
import { Subscription } from 'rxjs';
import { FormControl, FormGroup } from '@angular/forms';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-tchat',
  templateUrl: './tchat.component.html',
  styleUrl: './tchat.component.scss'
})
export class TchatComponent {

  messageForm = new FormGroup({
    userName: new FormControl(''),    
    message: new FormControl(''),
  });

  receivedMessages: string[] = [];
  private topicSubscription: Subscription;

  constructor(private rxStompService: RxStompService, private datePipe: DatePipe) {
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
