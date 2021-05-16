<?php

namespace Tests\Feature;

use App\Category;
use App\CodeLanguage;
use App\Content;
use App\Header;
use App\Panel;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class OperateOnPanelsTest extends TestCase
{
    use RefreshDatabase;

    protected $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = factory(User::class)->create();
    }

    /** @test*/
    public function guestsCantDuplicatePanels()
    {
        $response = $this->postJson('/api/panels/duplicate/1');
        $response->assertStatus(401);
        $response->assertSee('Unauthenticated');
    }

    /** @test */
    public function userCanDuplicatePanel()
    {
        $this->be($this->user, 'api');

        $panel = $this->createPanelWithHeadersAndContents();

        //given you visit api/panels/duplicate/{id}
        $this->postJson('/api/panels/duplicate/' . $panel->id);

        $this->assertCount(2, Panel::all());
        $this->assertCount($panel->headers->count() * 2, Header::all());
        $this->assertCount($panel->contents->count() * 2, Content::all());
    }

    protected function createPanelWithHeadersAndContents()
    {
        factory(Category::class)->create();
        factory(Panel::class)->create();
        factory(CodeLanguage::class)->create();
        factory(Header::class, 3)->create();
        factory(Content::class, 4)->create();
        return Panel::with(['headers','contents'])->first();
    }
}
