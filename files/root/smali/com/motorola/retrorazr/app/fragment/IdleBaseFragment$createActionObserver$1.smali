.class final Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;
.super Ljava/lang/Object;
.source "IdleBaseFragment.kt"

# interfaces
.implements Landroidx/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;->createActionObserver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/lifecycle/Observer<",
        "Lcom/motorola/retrorazr/app/statemachine/RazrAction;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Lcom/motorola/retrorazr/app/statemachine/RazrAction;",
        "kotlin.jvm.PlatformType",
        "onChanged"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xd
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;


# direct methods
.method constructor <init>(Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;->this$0:Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onChanged(Lcom/motorola/retrorazr/app/statemachine/RazrAction;)V
    .locals 2

    instance-of v0, p1, Lcom/motorola/retrorazr/app/statemachine/RazrAction$LeftSoftKeyButtonClick;

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;->this$0:Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;

    invoke-static {p1}, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;->access$handleLeftSoftKeyClicked(Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;)V

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lcom/motorola/retrorazr/app/statemachine/RazrAction$RightSoftKeyButtonClick;

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;->this$0:Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;

    invoke-static {p1}, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;->access$handleRightSoftKeyClicked(Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;)V

    goto :goto_0

    :cond_1
    instance-of v0, p1, Lcom/motorola/retrorazr/app/statemachine/RazrAction$CenterSoftKeyButtonClick;

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;->this$0:Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;

    invoke-static {p1}, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;->access$handleCenterSoftKeyClicked(Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;)V

    goto :goto_0

    :cond_2
    instance-of v0, p1, Lcom/motorola/retrorazr/app/statemachine/RazrAction$BrowserButtonClick;

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;->this$0:Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;

    invoke-static {p1}, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;->access$handleBrowserButtonClicked(Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;)V

    goto :goto_0

    :cond_3
    instance-of v0, p1, Lcom/motorola/retrorazr/app/statemachine/RazrAction$CenterButtonClick;

    if-eqz v0, :cond_4

    iget-object p1, p0, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;->this$0:Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;

    invoke-static {p1}, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;->access$handleCenterButtonClicked(Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;)V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;->this$0:Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;

    const-string v1, "it"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;->access$handleStateChangeAction(Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment;Lcom/motorola/retrorazr/app/statemachine/RazrAction;)V

    :goto_0
    return-void
.end method

.method public bridge synthetic onChanged(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/motorola/retrorazr/app/statemachine/RazrAction;

    invoke-virtual {p0, p1}, Lcom/motorola/retrorazr/app/fragment/IdleBaseFragment$createActionObserver$1;->onChanged(Lcom/motorola/retrorazr/app/statemachine/RazrAction;)V

    return-void
.end method
